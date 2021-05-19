package org.ghanbarip.auth.controllers;



import org.ghanbarip.auth.domain.User;
import org.ghanbarip.auth.domain.dto.CaptchaResponse;

import org.ghanbarip.auth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;


import javax.validation.Valid;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    private static final String CAPTCHA_URL = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    @Autowired
    private UserService userService;

    @Autowired
    private RestTemplate restTemplate;

    @Value("${recaptcha.secret}")
    String secret;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(@RequestParam("g-recaptcha-response") String captchaResponse,
                          @RequestParam("password2") String passwordConfirm,
                          @Valid User user,
                          BindingResult bindingResult,
                          Model model) {

        String url = String.format(CAPTCHA_URL, secret, captchaResponse);

        CaptchaResponse response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponse.class);

        if(!response.isSuccess()){
            model.addAttribute("captchaError", "FillCaptcha");
        }


        boolean isPasswordConfirmEmpty = passwordConfirm.isEmpty();

        if(passwordConfirm.isEmpty()){
            model.addAttribute("password2Error", "Password confirmation can not be empty");
        }

        if(user.getPassword()!= null && !user.getPassword().equals(passwordConfirm)){
            model.addAttribute("password2Error", "Passwords are not equals");
        }
        if(bindingResult.hasErrors() || isPasswordConfirmEmpty || !response.isSuccess()){
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errors);

            return "registration";
        }
        if (!userService.addUser(user)) {
            model.addAttribute("usernameError", "User exists!");
            return "registration";
        }

        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(@PathVariable String code,
                           Model model){
        boolean isActivated = userService.activateUser(code);

        if(isActivated){
            model.addAttribute("message", "Successfull activation");
            model.addAttribute("messageType", "success");
        }
        else {
            model.addAttribute("message", "Account is not activated");
            model.addAttribute("messageType", "danger");
        }
        return "login";

    }
}