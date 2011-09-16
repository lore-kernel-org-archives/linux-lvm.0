Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8GHKRqh002850
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2011 13:20:27 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8GHKIir021598
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2011 13:20:18 -0400
Date: Fri, 16 Sep 2011 13:19:22 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4E723D29.1020209@lichtenwalder.name>
Message-ID: <alpine.LRH.2.00.1109161318530.23537@bmsred.bmsi.com>
References: <4E6FAC6C.9010207@gmail.com>
	<CAEcYNt7duxpoeRTTA=+atmrNNcrcgMmX3h4JmRf++WMSJmxz1g@mail.gmail.com>
	<4E723D29.1020209@lichtenwalder.name>
MIME-Version: 1.0
Subject: Re: [linux-lvm] RHEL: special ownership for lv devices?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: klaus@lichtenwalder.name, LVM general discussion and development <linux-lvm@redhat.com>
Cc: Carlos Eduardo Tavares Terra <eduardo.terra@gmail.com>

On Thu, 15 Sep 2011, Klaus Lichtenwalder wrote:

> I created a start script that mknods /dev/dm-X from
> /dev/mapper/vg_asm--* devices, but I consider this a kludge...

Wouldn't symlinks be safer?

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
