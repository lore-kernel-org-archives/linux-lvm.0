Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9MLRHxt025100
	for <linux-lvm@redhat.com>; Sat, 22 Oct 2011 17:27:17 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9MLRFUv032229
	for <linux-lvm@redhat.com>; Sat, 22 Oct 2011 17:27:15 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p9MLQmYd020000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 22 Oct 2011 17:26:49 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p9MLQm24003139
	for <linux-lvm@redhat.com>; Sat, 22 Oct 2011 17:26:48 -0400
Date: Sat, 22 Oct 2011 17:26:48 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <CANp7ydPHg_Otp+XMrhn6TJ5c+-kn3Bc+mPaGtuN8exRtokYk-g@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1110221724110.3099@bmsred.bmsi.com>
References: <CANp7ydPHg_Otp+XMrhn6TJ5c+-kn3Bc+mPaGtuN8exRtokYk-g@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] unable to create mirror in LVM using lvconvert
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 22 Oct 2011, sabari G wrote:

> when i try to 
> lvconvert -m 1 vgnew/lvol4 
> 
> "not enough free pv for creating parallel allocation.."

By default, and for best performance, the bitmap must be on a 3rd PV. 
There are options to place the bitmap on the same PV as a leg, or to
keep it in memory (requiring a resync at boot).

Also, I hope your setup is for testing only.  Putting mirror legs on
the same device doesn't protect you much.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
