# example.aspectj

AspectJ runtime weaving examples with explicit and wildcard pointcuts
* Eclipse PDE 
* bndtools projects

## TOC

* [development environment setup](# development environment setup)
* [pde.target](#project pde.target)
* [example.aspectj.pde.app](#project example.aspectj.pde.app)
* [example.aspectj.pde.explicit](#project example.aspectj.pde.explicit)
* [example.aspectj.pde.wildcard](#project example.aspectj.pde.wildcard)


## development environment setup

IDE used for this projects, consists of the following parts

	Java 						j2se_1.7

    Eclipse Modeling Tools      4.4.2.20150219-0708                 epp.package.modeling
    AspectJ Development Tools   2.2.4.e44x-20141218-0900            org.eclipse.ajdt.feature.group
    Bndtools	                3.0.0.DEV-20150407-110613-g75c4277	bndtools.main.feature.feature.group

downloaded from

* [Eclipse](https://www.eclipse.org/downloads/)
* [AspectJ Development Tools](https://build.spring.io/artifact/AJDT-AE44/shared/build-latestSuccessful/update-site/)
* [Bndtools](https://bndtools.ci.cloudbees.com/job/bndtools.master/)
	
## [bnd](http://www.aqute.biz/Bnd/Bnd) / [bndtools](http://bndtools.org/)


### project cnf 
bnd configuration project. uses only locally contained bundles

    ├── cnf
    │   ├── eclipse_3.8_4.2_org.eclipse.osgi_3.8			    -> eclipse 3.8 bundles and respective AspectJ bundles
    │   │   ├── ...
    │   ├── eclipse_4.4_org.eclipse.osgi_3.10                   -> eclipse 4.4 bundles and respective AspectJ bundles
    │   │   ├── ...
    │   ├── eclipse_common_3.8                                  -> eclipse 3.8 bundles for eclipse rcp framework (used in 3.8 and 4.4 launches)
    │   │   ├── bndtools.runtime.eclipse.applaunch-0.1.0.jar    -> this bundle propagates program arguments from bnd launcher to the launched eclipse framework
    │   │   ├── ...
    │   ├── ext
    │   │   ├── ...
    │   │   └── repositories.bnd					            -> bnd "target" configuration via OBR repositories
    │   ├── ...

### project example.aspectj.bnd 
contains the AspectJ source code and the bundle definitions for explicit and wildcard usage

    ├── example.aspectj.bnd
    │   ├── bnd.bnd                                                 -> classpath/target for this project
    │   ├── explicit.bnd                                            -> bundle defintion of AspectJ wildcard bundle
    │   ├── run                                                     -> bndrun launch files with AspectJ runtime weaving configuration
    │   │   ├── launch_org.eclipse.osgi_3.10.x_explicit.bndrun
    │   │   ├── launch_org.eclipse.osgi_3.10.x_wildcard.bndrun
    │   │   ├── launch_org.eclipse.osgi_3.8.x_explicit.bndrun
    │   │   └── launch_org.eclipse.osgi_3.8.x_wildcard.bndrun
    │   ├── src
    │   │   └── example
    │   │       └── aspectj
    │   │           ├── explicit
    │   │           │   ├── ...
    │   │           └── wildcard									
    │   │               ├── ...
    │   └── wildcard.bnd											-> bundle defintion of AspectJ wildcard bundle
    
### project example.aspectj.bnd.app
contains the bnd version of the equinox application
    
    ├── example.aspectj.bnd.app
    │   ├── bnd.bnd
    │   ├── resources
    │   │   └── _plugin.xml
    │   ├── run                                                     -> bndrun launch files - application only
    │   │   ├── launch_org.eclipse.osgi_3.10.x.bndrun
    │   │   └── launch_org.eclipse.osgi_3.8.x.bndrun
    │   ├── src
    │   │   └── example
    │   │       └── aspectj
    │   │           └── app
    │   │               └── Application.java


## PDE 

Before execution of the PDE bundles you should set one of the targets either 3.8 or 4.4.

### project pde.target

contains the Eclipse PDE targets referencing the bundles from cnf projects
PDE handles bundles with identical BSN and different versions not properly, therefor those bundles are separated inside the cnf

    ├── pde.target
    │   ├── eclipse_3.8.target	-> target running with Eclipse 3.8 bundles
    │   └── eclipse_4.4.target	-> target running with Eclipse 4.4 bundles


### project example.aspectj.pde.app 
Eclipse/Equinox application project which will be modified by AspectJ

    ├── example.aspectj.pde.app
    │   ├── config
    │   │   └── config.ini                      -> default config.ini file
    │   ├── example.aspectj.pde.app.launch		-> PDE launch configuration - app only
    │   ├── META-INF
    │   │   └── MANIFEST.MF
    │   ├── plugin.xml
    │   └── src
    │       └── example
    │           └── aspectj
    │               └── app
    │                   └── Application.java    -> trivial application with one method call

### example.aspectj.pde.explicit
AspectJ project instrumenting the [example.aspectj.pde.app](#example.aspectj.pde.app)
	
    ├── example.aspectj.pde.explicit
    │   ├── config
    │   │   │   └── config.ini                      -> additional AspectJ specific configurations for weaving activation
    │   ├── example.aspectj.pde.explicit.launch     -> PDE launch configuration - launches app with runtime weaving configuration
    │   ├── links	                                -> AspectJ documentation links
    │   │   ├── ...
    │   ├── META-INF
    │   │   └── MANIFEST.MF                         -> additional AspectJ configuration - activate aspects via Export-Package
    │   └── src
    │       └── example
    │           └── aspectj
    │               └── explicit
    │                   ├── AfterAspectJ.aj
    │                   ├── AfterReturningAspectJ.aj
    │                   ├── AroundAspectJ.aj
    │                   ├── BeforeAspectJ.aj
    │                   └── BuildFixDummy.java		-> [Enable AspectJ compiler in plugin export](http://stackoverflow.com/questions/26215640/how-to-enable-aspectj-compiler-in-pluginexport-build)

### example.aspectj.pde.wildcard
AspectJ project instrumenting the [example.aspectj.pde.app](#example.aspectj.pde.app)
	
    ├── example.aspectj.pde.wildcard
    │   ├── config
    │   │   └── config.ini                          -> additional AspectJ specific configurations for weaving activation
    │   ├── example.aspectj.pde.wildcard.launch     -> PDE launch configuration - launches app with runtime weaving configuration
    │   ├── META-INF
    │   │   └── MANIFEST.MF                         -> additional AspectJ configuration - activate aspects via Export-Package
    │   └── src
    │       └── example
    │           └── aspectj
    │               └── wildcard
    │                   ├── AfterAspectJ.aj
    │                   ├── AroundAspectJ.aj
    │                   ├── BeforeAspectJ.aj
    │                   └── BuildFixDummy.java      -> [Enable AspectJ compiler in plugin export](http://stackoverflow.com/questions/26215640/how-to-enable-aspectj-compiler-in-pluginexport-build)

