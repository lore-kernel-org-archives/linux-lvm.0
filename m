Return-Path: <bs@infologic.fr>
Message-Id: <5.0.2.1.2.20010718104547.00a40ec0@193.0.0.208>
Date: Wed, 18 Jul 2001 10:48:55 +0200
From: Benoit SERRA <bs@infologic.fr>
Subject: Re: [linux-lvm] HUGE LVM log file...
In-Reply-To: <20010718092201.C382@btconnect.com>
References: <85063BBE668FD411944400D0B744267A643448@AUSMAIL>
 <85063BBE668FD411944400D0B744267A643448@AUSMAIL>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

At 18/07/01, you wrote:
>We've not had much feedback on this, I guess that people don't really
>notice much of a difference, I certainly haven't.  The allocation
>policy for PE's is to start at the beginning of the disk (which tend
>to have faster data transfer rates) and work back.  Anybody done any
>benchmarking in this area ?
>

Are you sure ?

In AIX, the system create PPS (PE) from the middle of the disk for 
performance reasons.

I heard on this list or on Linux-raid list that it's the middle of the disk 
which is the faster area.
