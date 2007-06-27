Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5RL5RwB010170
	for <linux-lvm@redhat.com>; Wed, 27 Jun 2007 17:05:27 -0400
From: Turbo Fredriksson <turbo@bayour.com>
Subject: Re: [linux-lvm] moving disk from PPC to x86
References: <87abuljfan.fsf@pumba.bayour.com>
Date: Wed, 27 Jun 2007 23:05:23 +0200
In-Reply-To: <87abuljfan.fsf@pumba.bayour.com> (Turbo Fredriksson's message of
	"Wed, 27 Jun 2007 22:47:12 +0200")
Message-ID: <876459jegc.fsf@pumba.bayour.com>
MIME-Version: 1.0
Sender: Turbo Fredriksson <turbo@pumba.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Turbo" == Turbo Fredriksson <turbo@bayour.com> writes:

    Turbo> The idea was to re-create sdb as mdX+missing, so I tried
    Turbo> pvmove sdb.  But instantly received a lot of errors. Now I
    Turbo> can't remove it from the VG!

This is the error I'm getting (starts more or directly after LVM
is setup):

[  370.565512] ata4: command 0x35 timeout, stat 0xd1 host_stat 0x1
[  370.565707] ata4: translated ATA stat/err 0xd1/00 to SCSI SK/ASC/ASCQ 0xb/47/00
[  370.565890] ata4: status=0xd1 { Busy }
[  370.565929] sd 3:0:0:0: SCSI error: return code = 0x8000002
[  370.565937] sdc: Current: sense key: Aborted Command
[  370.565943]     Additional sense: Scsi parity error
[  370.565967] end_request: I/O error, dev sdc, sector 12491199

The 'Scsi parity error' (from what I knew) is usually/most likley
due to faulty/insufficient PSU. I _should_ probably try to strap 
the new PSU to the desktop just to make sure, but... ?
-- 
bomb 767 PLO Uzi Ortega ammunition Soviet FSF radar NORAD pits colonel
Delta Force killed genetic
[See http://www.aclu.org/echelonwatch/index.html for more about this]
[Or http://www.europarl.eu.int/tempcom/echelon/pdf/rapport_echelon_en.pdf]
If neither of these works, try http://www.aclu.org and search for echelon.
Note. This is a real, not fiction.
http://www.theregister.co.uk/2001/09/06/eu_releases_echelon_spying_report/
http://www.aclu.org/safefree/nsaspying/23989res20060131.html#echelon
