package dk.bam.controllers;

import dk.bam.contracts.UserNamespaceController;
import dk.bam.models.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

import java.util.ArrayList;
import java.util.List;

@RestController
public class UserController implements UserNamespaceController {

    @GetMapping(value = "/{id}")
    public Mono<User> getUser(@PathVariable String id ){
        return Mono.just(new User());
    }

    @GetMapping
    public Flux<User> getUsers(){
        List<User> users = new ArrayList<User>();
        users.add(new User());
        return  Flux.fromIterable(users);
    }
}
