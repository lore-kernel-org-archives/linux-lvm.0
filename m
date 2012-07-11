Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6BCVk8J028921
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 11 Jul 2012 08:31:47 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1Sow54-0001E0-6u
	for linux-lvm@redhat.com; Wed, 11 Jul 2012 13:31:46 +0100
Date: Wed, 11 Jul 2012 13:31:46 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120711123146.GB2095@agk-dp.fab.redhat.com>
References: <CAGfHYAQg54kB4rRdCX1ubdi=K+LTBefw=AHELZeYb74XfNoXMg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGfHYAQg54kB4rRdCX1ubdi=K+LTBefw=AHELZeYb74XfNoXMg@mail.gmail.com>
Subject: Re: [linux-lvm] (simple question) Is it possible to specify a
	size	to extend an LVM partition to ? rather than the amount
	to increase	by?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jul 11, 2012 at 11:44:46AM +0100, Morgan Cox wrote:
> i.e say I have a 2GB partition and what to extend it to 10GB, I  know I
> could use  lvextend --size +8G /dev/vgpool/whatever

Try:

--size 10G

      -L, --size [+]LogicalVolumeSize[bBsSkKmMgGtTpPeE]
              Extend  or set the logical volume size in units of megabytes.  A
              size suffix of M for megabytes, G  for  gigabytes,  T  for  ter‐
              abytes, P for petabytes or E for exabytes is optional.  With the
              + sign the value is added to the actual size of the logical vol‐
              ume and without it, the value is taken as an absolute one.


Alasdair
