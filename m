Return-Path: <claudio@conectiva.com>
Date: Wed, 20 Dec 2000 20:21:16 -0200 (BRST)
From: Claudio Matsuoka <claudio@conectiva.com>
Subject: Re: [linux-lvm] '/etc/init.d/lvm' script in debian package
In-Reply-To: <0012210840470T.08762@lyta>
Message-ID: <Pine.LNX.4.21.0012202018200.3255-100000@scuzzlebutt.helllabs>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Gergely Tamas <dice@mfa.kfki.hu>

On Thu, 21 Dec 2000, Russell Coker wrote:

> Thanks for the suggestion about checking for a directory.  But how will I 
> determine what version of LVM if it's a directory?  Will there be 
> /proc/lvm/version?

You can check the LVM and IOP version in /proc/lvm/global.

[claudio@pokey:/home/claudio] cat /proc/lvm/global
LVM module version 0.9 (13/11/2000)

Total:  1 VG  1 PV  5 LVs (5 LVs open 5 times)

Global: 15258 bytes malloced   IOP version: 10   14:55:25 active

VG:  vg00  [1 PV, 5 LV/5 open]  PE Size: 4096 KB
  Usage [KB/PE]: 7557120 /1845 total  2465792 /602 used  5091328 /1243 free
  PV:  [AA] hda3                   7557120 /1845     2465792 /602      5091328 /1243  
    LVs: [AWDL  ] lv_swap                     131072 /32       1x open
         [AWDL  ] lv_tmp                       32768 /8        1x open
         [AWDL  ] lv_share                    204800 /50       1x open
         [AWDL  ] lv_home                    1048576 /256      1x open
         [AWDL  ] lv_src                     1048576 /256      1x open


claudio
