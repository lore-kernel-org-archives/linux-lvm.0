Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4ELS6O11903
	for <linux-lvm@redhat.com>; Sat, 14 May 2005 17:28:06 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.200])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4ELS0GE005222
	for <linux-lvm@redhat.com>; Sat, 14 May 2005 17:28:00 -0400
Received: by wproxy.gmail.com with SMTP id 68so1675073wra
	for <linux-lvm@redhat.com>; Sat, 14 May 2005 14:27:58 -0700 (PDT)
Message-ID: <87f94c370505141427e9e1340@mail.gmail.com>
Date: Sat, 14 May 2005 17:27:58 -0400
From: Greg Freemyer <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] disk capacity discrepancy: is it 1000 versus 1024?
In-Reply-To: <a06210281beac17a8abb2@129.98.90.227>
Mime-Version: 1.0
Content-Disposition: inline
References: <a06210281beac17a8abb2@129.98.90.227>
Content-Transfer-Encoding: 8bit
Reply-To: Greg Freemyer <greg.freemyer@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 5/14/05, Maurice Volaski wrote:
> I originally had a hardware RAID with fourteen 400 GB drives of
> usable capacity (Hitachi 7K400) . That's 5600 GB altogether. That's
> what both fdisk and df report (filesystem was ext3).
> 
> When I instead created an LVM2 physical volume on the device, I get
> just 5.09 TB.
> 
> Is LVM eating several hundreds gigabytes of space or is it the case
> that LVM uses terminology in a strict multiply by 1024 fashion versus
> everything else, which is multiplying by 1000. In that case, I guess
> the drives aren't really 400 GBs. :-(
> 
> However, it appears that parameters passed to LVM commands are
> interpreted using x1000, not x1024.
> 
> other keywords: gigabinarybytes, gibibytes, Gi, terabinarybytes, tebibytes, Ti.
> --
> 
> Maurice Volaski, mvolaski@aecom.yu.edu
> Computing Support, Rose F. Kennedy Center
> Albert Einstein College of Medicine of Yeshiva University

As Maurice implies NIST is making an effort (however small) to
standardize GB as 1000 * 1000 * 1000 bytes.

See http://physics.nist.gov/cuu/Units/binary.html

So per NIST:
GB = Gigabyte = 1,000 * 1,000 * 1,000 Bytes
GiB = Gibibyte  = 1,024 * 1,024 * 1,024 Bytes

Or for Maurice TB vs. TiB

BTW, the difference between TB and TiB is almost 10% so this has a
very user observable effect and would explain Maurice's discrepancy.

So if I understand Maurice's question, it becomes:
   "Is LVM reporting TiB units with a TB designation?"

Greg
-- 
Greg Freemyer
The Norcross Group
Forensics for the 21st Century
