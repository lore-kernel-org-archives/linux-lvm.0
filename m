Subject: Re: [linux-lvm] LVM available on software raid5 (md)
References: <000001c1b6a8$7d7efdc0$0700000a@eagle7>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: "Anthony Luke Nelson"'s
    message of
    "Sat, 16 Feb 2002 00:12:11 -0500"
Message-Id: <ufaofiqhumy.fsf@epithumia.math.uh.edu>
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
Date: Fri Feb 15 23:18:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "ALN" == Anthony Luke Nelson <tony.nelson@pobox.com> writes:

ALN> Does anyone know if LVM is supported on software raid5.

Works fine for me:

md5 : active raid5 sdh7[1] sdg7[6] sdf7[5] sde7[4] sdd7[3] sdc7[2] sdb7[7] sda7[0]
      416837376 blocks level 5, 128k chunk, algorithm 2 [7/7] [UUUUUUU]

VG:  nas  [1 PV, 11 LV/10 open]  PE Size: 8192 KB
  Usage [KB/PE]: 416825344 /50882 total  386924544 /47232 used  29900800 /3650 free
  PV:  [AA] md5                   416825344 /50882   386924544 /47232   29900800 /3650

 - J<
