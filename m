Return-Path: <tandem@dnmi.no>
Subject: Re: [linux-lvm] SCSI/LVM problems after power outage
References: <DC5B1A21E9E7D211B0020090273AD628242BE0@summit15.corvallis.summit>
	<20010509093510.B4918@sistina.com> <3AFB9CB4.DEFEC342@wrkhors.com>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 11 May 2001 10:37:49 +0200
In-Reply-To: Steven Lembark's message of "Fri, 11 May 2001 03:03:00 -0500"
Message-ID: <wveltwffhe.fsf@freeze.oslo.dnmi.no>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Steven" == Steven Lembark <lembark@wrkhors.com> writes:

    >> Steps needed (crossing your fingers that the flaky drive can
    >> still stand this):

    Steven> q: any known way to just dump the lv's out to tape?
    Steven> problem w/ pvmove is that you have to update data stored
    Steven> on the flakey device.

I might have misunderstood but : dd if=<lv> of=<tape> 

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
