From: "Jamie Krasnoo" <webmaster@planetphat.com>
Subject: RE: [linux-lvm] ERROR: 0.8final/tools/lib/liblvm.h:50: gnu/types.h: No such file or directory
Date: Sun, 30 Jul 2000 02:22:58 -0700
Message-ID: <IPEIKNKIKIPGILIEMOIBIENJCLAA.webmaster@planetphat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20000730083725.A1523@home.ds9a.nl>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

No but it should be. Thanks to Sys Admin Magazine's writer Rafeeq Ur Rehman
who wrote an article on LVM in the August issue, how to install it and
configure it. I was able to solve the problem.

-- from the article . page 20 - Compiling LVM Utilities --

You must make another change in tools/lib/liblvm.h file at line 50 for this
version of LVM. Change gnu/types.h to sys/types.h
at line 50 for a smooth compilation.

-- end cut --

Not exactly a smooth compilation (lots of warnings) and thats not the exact
snippet either. I corrected a few minor things but this should get you
throug to the next step.

Good luck,

Jamie


-----Original Message-----
From: owner-linux-lvm@msede.com [mailto:owner-linux-lvm@msede.com]On
Behalf Of bert hubert
Sent: Saturday, July 29, 2000 11:37 PM
To: linux-lvm@msede.com
Subject: Re: [linux-lvm] ERROR: 0.8final/tools/lib/liblvm.h:50:
gnu/types.h: No such file or directory


On Sun, Jul 30, 2000 at 01:15:37AM -0400, Justin Hamilton wrote:
> I guess I have something missing.  Anyone know what?

This is a FAQ and on the homepage I believe.

--
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
