Return-Path: <tandem@dnmi.no>
Subject: Re: [linux-lvm] SCSI/LVM problems after power outage
References: <DC5B1A21E9E7D211B0020090273AD628242BE0@summit15.corvallis.summit>
	<20010509093510.B4918@sistina.com> <3AFB9CB4.DEFEC342@wrkhors.com>
	<wveltwffhe.fsf@freeze.oslo.dnmi.no> <wxxsnic56bq.fsf@fjorir.ifi.uio.no>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 11 May 2001 16:48:20 +0200
In-Reply-To: Terje Kvernes's message of "11 May 2001 16:05:45 +0200"
Message-ID: <wvd79gdjrf.fsf@freeze.oslo.dnmi.no>
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

>>>>> "Terje" == Terje Kvernes <terjekv@math.uio.no> writes:

    Terje> Adrian Phillips <a.phillips@dnmi.no> writes:
    >> I might have misunderstood but : dd if=<lv> of=<tape>

    Terje>   doesn't dd fail if it reaches a single back block?

Oh, try dd if=<lv> of=<tape> conv=noerror

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
