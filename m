Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mAAH2nL8002414
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 12:02:50 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1KzaA4-0005Dw-L1
	for linux-lvm@redhat.com; Mon, 10 Nov 2008 17:02:48 +0000
Date: Mon, 10 Nov 2008 17:02:48 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] reading lun snapshots with identical
	lvminformationonthem on one machine
Message-ID: <20081110170248.GG16649@agk.fab.redhat.com>
References: <8D07631D47C3CB4F867AD7BCF07D5C232C93@excs01.bucoks>
	<8D07631D47C3CB4F867AD7BCF07D5C2307F48F@excs01.bucoks>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8D07631D47C3CB4F867AD7BCF07D5C2307F48F@excs01.bucoks>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 10, 2008 at 10:34:50AM -0600, James A. Dinkel wrote:
> I think the key is this option: --config 'global{activation=0}' which I
> left out.  How can I combine that with my filter rule in the --config
> option?
  
Yes - just list them one after the other within the quotes
--config 'global { ... } devices { ... }'
 
Alasdair
-- 
agk@redhat.com
