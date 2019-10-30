I2P-SDK-meta
============

Meta-repository collecting guidelines and tools for developing applications that
use I2P via an API like SAM or I2CP. This is a work in progress and this project
is consists of automating of a multitude of small, repeatable tasks, some of
which will emerge on a case-by-case basis as new software integrates with I2P.

Assumptions, Goals for this project
-----------------------------------

 * There exist many applications that could benefit from interacting with I2P
 * There exist many applications that I2P could benefit from working with
 * Many of these applications are *not* in Java and may be reluctant to depend
  on a JVM.
 * *There exist many common(shared) difficulties for these projects who wish*
  *to depend on I2P, including*
  - Many of these applications have existing, non-anonymous users who will be
   upset by a percieved loss of performance if they are automatically switched
   to I2P mode. Therefore, they will wish to enable I2P support *optionally*
   for their existing users
  - Since an I2P router may not be present on the machine, some applications
   may wish to reccommend that I2P be installed *alongside* them at install
   time, *especially* on Windows. At the same time, it isn't useful to install
   a second I2P router on the same PC. Therefore, for managing I2P as a
   dependency of third-party applications, a set of "presence-detection
   guidelines for install-time validation of I2P routers" will be developed
   along with accompanying tools for automating that process.
  - Such a toolset to determine whether or not to enable I2P capabilities(For
   instance, exposing an "Anonymous mode" UI component that makes the
   application use I2P connections only), although in many cases it is better
   to determine this at runtime instead.
  - At runtime, detection of various aspects of the state of an I2P router may
   be desirable for these applications, however of them will merely wish to
   confirm that the router is actually running and that their desired API is
   exposed.

Therefore, the goal for this project is to *locate and resolve points of*
*friction that prevent application developers from using I2P capabilities in*
*their own applications* and by *treating bridging as a natural step in the*
*transition between a non-anonymous to anonymous peer-to-peer application*.

It may without saying that many of the applications that would be aided by this
are so-called "Distributed Web" applications intended to be run by individuals
like ZeroNet or Dat.

Important information that already exists
-----------------------------------------

### I2P Application Development

 * [I2P Application Development Guidelines](https://geti2p.net/en/get-involved/develop/applications)
 * [SAM v3.x API](https://geti2p.net/en/docs/api/samv3)
 * [SAM Tutorial](https://geti2p.net/en/blog/post/2019/06/23/sam-library-basics)
 * [Def-Con Workshop Handout](https://github.com/eyedeekay/defcon)

Important software for an I2P SDK
---------------------------------

### Dependency-Free I2P Routers

 * [I2P-Zero dependency-free I2P router](https://github.com/i2p-zero/i2p-zero)
 * [Cross-Compile i2pd statically for the Raspbeery Pi](https://i2p.rocks/blog/cross-compile-i2p-for-rasberry-pi.html)
 * [i2pd static compilation issue tracking](https://github.com/PurpleI2P/i2pd/issues/602)
 * [Jlinked I2P Build Scripts](https://github.com/zlatib/i2p.jlink)

### Generic I2P Router Detection Tools(That run regardless of the presence of a router)

 * [checki2cp](https://github.com/eyedeekay/checki2cp): Check for the presence
  of an I2P router in the default installation directories or by making, then
  closing, an I2P connection. Small Go library and terminal application.
 * [iget](https://github.com/eyedeekay/iget): Terminal-based HTTP client for SAM
  that can be used to determine if SAM is running.
 * TODO: Detect running I2P router features by examining ps output.

### Bundling Tools

 * [This Repo:](https://github.com/eyedeekay/I2P-SDK-meta)
 * TODO: Create machine-readable report of current I2P router version on web
  site for use by bundling tools.
