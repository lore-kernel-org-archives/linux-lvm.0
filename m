Message-ID: <004e01c2d119$ce050be0$0d01a8c0@aphrodite>
From: "Rupert Hair" <rupert.hair@ntlworld.com>
References: <000801c2d0e8$91e8d320$0d01a8c0@aphrodite> <20030210143353.A5958@sistina.com>
Subject: Re: [linux-lvm] PV Status NOT available
MIME-Version: 1.0
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
Date: Mon Feb 10 09:31:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> do all 3 PVs show up active (the [] following 'PV:' should contain 'AA'
> unless you set a PV to inallocatable) in /proc/lvm/global ?
LVM driver LVM version 1.0.5(15/07/2002)

Total:  1 VG  3 PVs  1 LV (1 LV open 1 times)

Global: 179278 bytes malloced   IOP version: 10   5 days 1:33:43 active

VG:  datavg  [3 PV, 1 LV/1 open]  PE Size: 32768 KB
  Usage [KB/PE]: 357171200 /10900 total  357171200 /10900 used  0 /0 free
  PVs: [AA] hdg1                  119996416 /3662    119996416 /3662
0 /0
       [AA] hde1                  119996416 /3662    119996416 /3662
0 /0
       [AA] hdf1                  117178368 /3576    117178368 /3576
0 /0
    LV:  [AWDL  ] datalv                   357171200 /10900    1x open

Looks like Patrick and I have the same problem.  Thanks for your help Heinz.

Rupert
