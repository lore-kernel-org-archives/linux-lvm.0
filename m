Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAJDIXiM028277
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2010 08:18:34 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1PJQrJ-0006pW-4J
	for linux-lvm@redhat.com; Fri, 19 Nov 2010 13:18:33 +0000
Date: Fri, 19 Nov 2010 13:18:33 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20101119131832.GG30435@agk-dp.fab.redhat.com>
References: <4CE5F117.4040309@cfl.rr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4CE5F117.4040309@cfl.rr.com>
Subject: Re: [linux-lvm] 2.0.76 memory allocation error
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

On Thu, Nov 18, 2010 at 10:37:59PM -0500, Phillip Susi wrote:
> libdm/libdm-report.c, line 932 in _output_field() uses free() when it  
> should be using dm_free().  

Thanks for spotting that.  (Only broken when debugging enabled.)

Alasdair
