# Lab 5 – Self-check answers

**1. What is the difference between push and pushReplacement?**
`push` puts the new screen on top of the current one, so you can go back to it.
`pushReplacement` throws the current screen away and puts the new one in its place, so
there's no way back. That's why it's used after login (task 1.3): once you're in, the
back button shouldn't take you to the login screen again.

**2. Why should route names be kept in constants?**
Route names are just strings, so a typo like `'/setings'` compiles fine and only breaks
when you tap the button. With constants (`AppRoutes.settings`) the compiler catches typos,
autocomplete helps, and if a name changes you only change it in one place.

**3. How do you return a value from a screen, and what is received if the user presses
the system back button?**
The second screen calls `Navigator.pop(context, value)`. The first screen opened it with
`final result = await Navigator.push(...)`, so `result` gets that value. If the user leaves
with the system back button or the AppBar arrow, nothing is passed to `pop`, so the
result is `null`. You have to check for `null` and keep the old value (task 3.4).

**4. What is the difference between context.go and context.push in go_router?**
`go` jumps to a location and rebuilds the stack to match that URL, replacing what was
there. If the route isn't a sub-route of the current one, there's no back arrow.
`push` adds the screen on top of the current stack, like `Navigator.push`, so the back
arrow appears and `pop` returns to the previous screen.

**5. When is a path parameter better than extra?**
When the data has to survive a reload or a shared link. A path parameter is part of the
URL (`/product/2`), so it's still there after refreshing the browser or opening a deep link.
`extra` only lives in memory: after a reload it's `null` and the screen breaks. `extra`
is fine for passing a big object during normal in-app navigation, but the screen should
be able to work from the id alone.
