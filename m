From: "Martin K. Petersen" <martin.petersen@oracle.com>
References: <4D7E4689.9060300@cox.net> <20110314171726.GA18249@redhat.com>
	<4D812183.6000901@cfl.rr.com> <20110316225539.GA3662@redhat.com>
	<4D8151EF.5020301@cfl.rr.com>
Date: Wed, 16 Mar 2011 20:39:32 -0400
In-Reply-To: <4D8151EF.5020301@cfl.rr.com> (Phillip Susi's message of "Wed, 16
	Mar 2011 20:12:31 -0400")
Message-ID: <yq1vczivauz.fsf@sermon.lab.mkp.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Advanced Format disks mixed with regular disks?
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Ron Johnson <ron.l.johnson@cox.net>, Mike Snitzer <snitzer@redhat.com>

>>>>> "Phillip" == Phillip Susi <psusi@cfl.rr.com> writes:

Phillip> The kernel has the ability to read it from the drive and report
Phillip> it to the user space tools, which have been patched to use it,
Phillip> but the WD EARS drives lie and claim 512/512 instead of
Phillip> 512/4096.

The saving grace is that modern util-linux/dm tooling aligns on 1MB by
default instead of sector 63.

And yes, there are Advanced Format drives shipping from both Hitachi and
Seagate...

-- 
Martin K. Petersen	Oracle Linux Engineering
