Message-ID: <1063980916.3f6b0f740b738@secure.st-peter.stw.uni-erlangen.de>
From: Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>
Subject: Re: [linux-lvm] Migrate from LVM1 to LVM2...
References: <1063917231.1786.13.camel@super.gamux.chezmoi> <3F6B0E0F.5080807@webhackande.se>
In-Reply-To: <3F6B0E0F.5080807@webhackande.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Fri Sep 19 09:16:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Quoting Rickard Olsson <richie@webhackande.se>:

> Eddahbi Karim wrote:
> 
> > I'm working with a Gentoo system, vanilla source 2.4.21 + preempt.
> > gcc 3.2
> 
> I just compiled the device-mapper into the kernel (same place in 
> menuconfig as RAID, EVMS and LVM - I used the 2.4.22-ac1 kernel), did an
> 
> emerge unmerge lvm-user
> 
> and
> 
> emerge lvm2
> 
> Note: You will need to either set the ACCEPT_KEYWORDS="~x86" flag in 
> make.conf or on the commandline just prior to emerging lvm2 since LVM2 
> is masked as experimental in Gentoo.
> 
> I had metadata problems so I didn't get LVM2 running perfectly, but the 
> commands are basically the same as in LVM1 so you should not need to 
> change any startup-files.

so your scripts are already for dm-mod ?-)
( happy Gentoo users :-) )

i think most distros will need sed '/lvm-mod/s/lvm-mod/dm-mod/'

svetljo 
