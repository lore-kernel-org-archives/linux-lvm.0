Return-Path: <Jan.Schreckenbach@sap.com>
Message-ID: <3B821AB8.1A324381@sap.com>
Date: Tue, 21 Aug 2001 10:24:24 +0200
From: Jan Schreckenbach <Jan.Schreckenbach@sap.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems with 1.0
References: <BJEHIDHMNHMANMFJEKAPGEAGCAAA.tren@eotnetworks.com>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Tren Blackburn wrote:
[snipp]
> >> I had installed the 1.0 driver into my 2.4.8 kernel, and rebooted.
> >> Everything came up fine, so I installed the user tools and forgot about
> >> them...until I had to reboot this evening...Now the LVM tools are
> >> dynamically linked (Looking for libgcc_s.so.1)?  Or so it seems.  I am
> no
> >> a C programmer and don't fully understand how linking works, but it
> seems
> >> to me that the beta 8 tools were statically linked as they didn't need
> any
> >> external libraries, but the 1.0 user tools are dynamically linked.
> >>
> >> Now this probably doesn't seem like a problem, but when your libraries
> are
> >> mounted on a LVM volume and you have no tools to activate your volume
> >> with...well...you can probably guess  =)  Luckilly I had an identically
> >> configured machine that I hadn't upgraded to 1.0 yet (same gcc 3.0
> >> compiler, etc) so I just copied the tools across to the other machine
> >> (beta 8 tools) and all is fine again.
> >>
> >> If I am completely off base as to what is happening here, please
> correct
> >> me, and please also let me know how to solve this problem.>
> >
> >Tren,
> >that shouldn't be a problem because the default installation directory
> for
> >shared libraries is /lib which belongs to the root directory. LVM tools
> just
> >access any shread libraries from there unless you use the --libdir
> configure
> >option to chosse a different one.
> >
[snipp]
> Also, to answer another persons question, no, I did *not* build the beta 8
> tools with 2.9x.  Both beta8 and 1.0 were built with 3.0.  3.0 was built
> with 2.9x and then 2.9x was uninstalled.  The libraries for 3.0 sit in
> /usr/local/lib, not /lib.
> 
> So, the problem is with 1.0 tools, it needs access to a filesystem that is
> *not* mounted to load in the library.
> 

Hi,

you must not have a part of your base system on a partion
other than /. If you compile programms that are part of your
base system with gcc-3 you need to have the libraries in your
root-partition. 
The time you installed gcc-3 ist was a kind of add-on, because
you did not need it for any part of your base system. Therefore
it was OK to have it on /usr/local.
Reinstall gcc-3 on / or compile LVM with gcc-2.9x. You may
also do a ldd on every binary you need from LVM and copy
the libraries over to /lib.

cu,
Jan

--
_______________________________________________________________________

THE BEST RUN E-BUSINESSES RUN SAP
_______________________________________________________________________

Jan Schreckenbach                      email: Jan.Schreckenbach@sap.com
SAP AG Walldorf/Baden, Germany         Phone: +49 6227  7-47474
LinuxLab                               Fax  : +49 6227 78-31414

SAP LinuxLab support address: linux@sap.com
