Date: Thu, 26 Aug 1999 15:28:35 -0400 (EDT)
From: "S. Ryan Quick" <ryan@phaedo.com>
Subject: Re: [linux-lvm] LVM in stock kernel!?
In-Reply-To: <4.2.0.58.19990826121935.00fc6c30@204.151.72.2>
Message-ID: <Pine.LNX.3.96.990826151731.23765C-100000@aristotle.phaedo.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mats Wichmann <mats@laplaza.org>
Cc: linux-lvm@msede.com

-----BEGIN PGP SIGNED MESSAGE-----

On Thu, 26 Aug 1999, Mats Wichmann wrote:

[deletia]

> 
> Not terribly familiar with Linux LVM (listening here to help become so)...other
> LVMs require a large number of commands to become familar with (the AIX
> LVM being the prototype which _most_ folks have followed; Solaris takes
> a somewhat different approach).  Actually, a well-thought out GUI can be
> a great help here.  The author of a course I teach has constructed one as
> a sample which gives you drag-and-drop LVM management - in very little
> tk/perl code.

While I think the GUI thing is nice, and as a proponent of the VERITAS Volume Manager despite a great affinity for IBM's
LVM, I have to say that the GUI inevitably leaves some small, but super-crucial piece out.  As a long time AIX and Veritas
consultant, I have to say I long ago gave up both smit and vxva in favor of the good old CLI.  I think that giving Linux LVM
a gui might eventually prove useful, but right now, I think it better to develop as many CLI tools as possible and stabilize
the code.  I want to see Oracle start recommending LVM (on Debian -- I'm tired of all this redhat stuff, hehehe) as a
definite boost.

Some other Pros to add:

Integration with IBM's ADSM backup allows Linux machines to be backed up "snapshot" style by simply syncing volumes and
grabbing volume data.

The ability to add a sort of volume log allows almost instant volume resyncing while maintaining an active data volume.

The (unique) ability to use either physical disks or partitions (and even flat files via the loopback device) allows for a
very flexible Volume Group makeup (e.g. I don't get stuck having to allocate all of that 18GB drive to a volume when I only
need 4GB of it, etc.).  NOTE:  This does add some cons when it comes to deporting (exporting) volumes and migrating disks,
but it should be easy enough to overcome.

Ryan

> 
> 

%                                                       %%%%%%%%%%
%%           S. Ryan Quick                               %%%%%%%%%
%%%           UNIX Systems Engineer                       %%%%%%%%
%%%%           Phaedo Consulting, Inc. -- Exec VP          %%%%%%%
%%%%%                                                       %%%%%%
%%%%%%         www.phaedo.com/ryan/  ryan@phaedo.com         %%%%%
%%%%%%%       ------------ PGP FingerPrint -------------      %%%%
%%%%%%%%  CF 19 6B BA 31 8E B8 8E  20 DF 4F 2B 2E 69 81 F5     %%%
%%%%%%%%%     ------------------------------------------        %%
%%%%%%%%%%                                                       %

-----BEGIN PGP SIGNATURE-----
Version: 2.6.3a
Charset: noconv

iQCVAwUBN8WVZPUYDAQiV+tNAQGCUAP+OOrbJdssjX+D3FUCtM4+BmrZy4nPYCh+
lcPS2QNCfU96YI9XAuVcs/e33JkQB/ZTJw41q+dnSLKUi1RvIKy8xx2OfJ7HFKFB
7wmmM+WunHlcAj0xn72qvL2RhsDUE2VHM8LsaByOPtvxyMbXYctEg22fRNV7sEAL
9nJiqqdiw+U=
=FjWD
-----END PGP SIGNATURE-----
