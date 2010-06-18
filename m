Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5IFqjuw010836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 18 Jun 2010 11:52:46 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1OPds5-0004Z7-HQ
	for linux-lvm@redhat.com; Fri, 18 Jun 2010 16:52:45 +0100
Date: Fri, 18 Jun 2010 16:52:45 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100618155245.GH15698@agk-dp.fab.redhat.com>
References: <4C17D1BF.9010103@redhat.com> <4C17E16B.8000708@cfl.rr.com>
	<4C17E56D.5010808@redhat.com> <4C181C07.9080001@cfl.rr.com>
	<4C18999F.9000903@redhat.com> <4C19259F.2040706@redhat.com>
	<4C19DB6C.2030905@redhat.com> <4C1A28DE.4040605@redhat.com>
	<4C1B826B.1010200@redhat.com> <4C1B87C1.3090303@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4C1B87C1.3090303@redhat.com>
Subject: Re: [linux-lvm] Why does every lvm command insist on touching	every
	pv?
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

On Fri, Jun 18, 2010 at 10:50:41AM -0400, Takahiro Yasui wrote:
> For example, there are six PVs and two VGs as below:
> 
>   VG1: PV1, PV2, PV3
>   VG2: PV4, PV5, PV6
> 
> If we create a new LV or delete VG1, then metadatas on only PV1, PV2, PV3
> need to be updated but not for PV4, PV5, PV6.
 
Correct - and the tools have always behaved like that!

(I don't think this thread is going anywhere useful.)

Alasdair
