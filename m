Message-ID: <3BA280D6.5020604@st-peter.stw.uni-erlangen.de>
Date: Sat, 15 Sep 2001 00:12:38 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Lock Patch
References: <NBBBJHKIOKPKOGOEPEDPCEFKDNAA.stuart@bh90210.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

i've forgoten

> you saying that typing, "make" in the "PATCHES" directory will cause a patch to be generated specifically for my kernel? 
>
thats actually the work of ./configure it trys to find out what you 
have, and what you need
in PATCHES it chooses from all the patches the ones your kernel need ,
and " make " put them together in one patch for your kernel 

> What name will it be given?
>        The documentation says to add a dash dash kernel-dir= or something or other after the "./configure" command, are you saying it is better to use "./configure" absent that appended statement?
>         Where do I untar the LVM source? Does it matter where I do so? May I do it in /tmp?
>
1
