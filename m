Return-Path: <terje.eggestad@scali.no>
Subject: Re: [linux-lvm] Ow.. not again
From: Terje Eggestad <terje.eggestad@scali.no>
In-Reply-To: <Pine.LNX.4.21.0108210453440.15709-100000@nutrot.ern-e.org>
References: <Pine.LNX.4.21.0108210453440.15709-100000@nutrot.ern-e.org>
Content-Transfer-Encoding: 7bit
Date: 21 Aug 2001 13:25:31 +0200
Message-Id: <998393131.880.31.camel@pc-16.office.scali.no>
Mime-Version: 1.0
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
To: elim <elim@nutrot.ern-e.org>
Cc: linux-lvm@sistina.com

Not sure if it applies to you, but vgscan fail on my box if there
is a CD in the CDROM. (audio and data), looks like you get a different
error, but just in case.....

Den 21 Aug 2001 05:53:48 -0400, skrev elim:
> Hiya
> 
> After a lengthy period of uptime, my Linux box was rebooted today and this
> is what it spewed out on bootup:
> 
> vgscan -- found inactive volume group "vg01"
> vgscan -- reading data of volume group "vg01" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> data of volume group "vg01" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
> "/etc/lvmtab" and "/etc/lvmtab.d"
> 
> 
> I tried the vgcfgrestore but then I ended up with "No volume groups
> found" error. I then tried dd'ing the vg info onto the pv's as per a
> previous post which basically got me back to the "ERROR
> "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> data of volume group "vg01" from physical volume(s)" error. 
> 
> Basically Im going in circles. I even tried the uuid_fixer but it seems it
> does the same thing as the dd trick.
> 
> I've scoured the faq's and read one too many list messages... can somebody
> please help??? Having my fs's back would be really convenient right now :)
> 
> Kernel is 2.2.19aa1 and Iam using 0.9beta4 of lvm and the tools. The vg
> on disk was created pre 0.6.. i cant remember exactly.
> 
> Thanks.
> Ernie
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
-- 
_________________________________________________________________________

Terje Eggestad                  terje.eggestad@scali.no
Scali Scalable Linux Systems    http://www.scali.com

Olaf Helsets Vei 6              tel:    +47 22 62 89 61 (OFFICE)
P.O.Box 70 Bogerud                      +47 975 31 574  (MOBILE)
N-0621 Oslo                     fax:    +47 22 62 89 51
NORWAY            
_________________________________________________________________________
