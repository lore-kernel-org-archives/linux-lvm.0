Return-Path: <lembark@wrkhors.com>
Date: Mon, 16 Jul 2001 10:08:02 -0500
From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Newbie question
Message-ID: <235800000.995296082@dizzy>
In-Reply-To: <20010716133321.E11625@sistina.com>
References: <FDEJIMPDHJAAPNLFKBMGAECACEAA.tgs@iafrica.com>   <20010712094638.B418@btconnect.com>  
 <200107121612.MAA13656@burns.luca.2y.net>   <20010713131200.C32198@sistina.com>   <200107131652.MAA15766@burns.luca.2y.net>
 <20010716133321.E11625@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

>> Now I have a question. I read the HOWTO migrate the old root partition to a
>> LV

Think really, really hard before trying this.  Linux on an X86 doesn't have
an LVM aware bios and you cannot boot w/o LVM (e.g., HP's "-lm").  This
means that if you have any error at all in LVM you cannot boot.

A safer approach -- especially if you havn't used LVM before -- is to use
the first 2-3 partitions for /, swap and /var.  This allows you to boot even if
LVM is down and fix most LVM problems.  None of these partitions needs
to be large (e.g., 80, 64 & 320MB) and the remaining partition can be used
as a PV.

sl
