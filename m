Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i23Cwh805339
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 07:58:43 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i23CwgZ32587
	for linux-lvm@redhat.com; Wed, 3 Mar 2004 06:58:42 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Re: Why can't I extend a LV after many times extends?
Message-ID: <20040303065842.I32693@homer.msp.redhat.com>
References: <20040302153451.GA13034@lepton.goldenhope.com.cn> <20040303075221.GA15698@lepton.goldenhope.com.cn> <20040303101044.GA16216@lepton.goldenhope.com.cn>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040303101044.GA16216@lepton.goldenhope.com.cn>; from lepton@mail.goldenhope.com.cn on Wed, Mar 03, 2004 at 06:10:44PM +0800
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Mar  3 07:57:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Mar 03, 2004 at 06:10:44PM +0800, lepton wrote:
> 3. Now when I lvextend, it complains :
> 
>       VG amd64 metadata too large for circular buffer
> 
>       (lib/format_text/format_text.c line 363)
 
If you *really* want to do things this way, you'll also need to make your
on-disk metadata area (which contains the "circular buffer" that
message refers to) several times bigger before you start:  
see pvcreate --metadatasize

Alasdair
-- 
agk@redhat.com
