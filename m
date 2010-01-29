Message-ID: <4B62A89E.5060201@redhat.com>
Date: Fri, 29 Jan 2010 10:21:34 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <824411.76784.qm@web87113.mail.ird.yahoo.com>
In-Reply-To: <824411.76784.qm@web87113.mail.ird.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] alternative to pvmove on root volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: chris procter <chris@chrisprocter.co.uk>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: chris procter <chris-procter@talk21.com>

On 01/28/2010 09:11 PM, chris procter wrote:
> pvmove has a nasty habit of deadlocking the machine when used on root
> volumes.

please report bug then, with system configuration (lvmdump)
and process backtrace (log from echo t>/proc/sysrq-trigger)
when it deadlocks.

pvmove should work for moving root volume
(except some special situations, like when you increase log level
and log itself is on moved LV)

(And I used pvmove several times myself to move system disk to another
without any problems on RHEL5.3)

Milan
