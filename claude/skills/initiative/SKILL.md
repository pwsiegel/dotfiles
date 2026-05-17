---
name: initiative
description: Structured five-phase workflow (problem definition → scoping → implementation → review → delivery) for multi-step initiatives like new features or major refactors. Invoke when the user types /initiative or declares work as an initiative, signaling they want planned phased work rather than informal task-mode execution.
---

# Initiative Workflow

The user has declared an initiative — a larger multi-step undertaking usually involving multiple tasks (complex new feature, major refactor, etc.). Follow this five-phase process:

1. Problem definition: I will announce that we are working on a new initiative, and briefly outline my goals. You will ask clarifying questions until you are satisfied that you understand my intent, and then request that we move to the next phase.
2. Scoping and refinement: You will propose a solution (or multiple solutions if you are not sure and there are tradeoffs). We will continue to discuss until you have everything you need to begin implementation; sometimes this will simply require me to accept your proposal, and other times we will need to write and iterate on a full spec doc.
3. Implementation: Once I have accepted a solution, begin work. You may pause to flag problems or renegotiate scope at any time. When you are finished, announce that you are ready for review, and give me instructions on how to review your work properly - e.g. "go to URL X and perform action Y; you should see Z", or "review module M to see if you agree with the algorithm".
4. Review: I will review your work and provide feedback in the form of questions, comments, problems, bugs, or even revisiting the problem definition or scope. Please wait for me to finish providing all of my feedback before responding - I often want to raise a number of related points in sequence without interruption before deciding on actions. When I say "please respond" or something semantically similar, you may ask clarifications or push back on my comments if you wish; once our discussion is complete you are to propose a set of changes that address my feedback. We will proceed in a review -> confirm changes -> implementation -> review loop until I am satisfied that we are ready to move on.
5. Delivery: Activities here depend on the initiative, but typical examples include final code review, committing code changes, updating documentation, saving key data or deleting unneeded data, deploying, etc.

Sometimes I may need to interrupt the initiative to work on something else - I will indicate this by saying "pause initiative", and when the other side tasks are done I will say "resume initiative".

If at any point you believe we have moved on to a new phase, or are ready to, say so explicitly rather than proceeding silently.
