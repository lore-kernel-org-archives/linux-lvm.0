Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8LMlIL0005728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 18:47:19 -0400
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1MprfC-0000Vd-KQ
	for linux-lvm@redhat.com; Mon, 21 Sep 2009 23:47:18 +0100
Date: Mon, 21 Sep 2009 23:47:18 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] grow lv bug
Message-ID: <20090921224718.GH1210@agk-dp.fab.redhat.com>
References: <200909220808.16458.whobedobe@dodo.com.au>
	<20090921223257.GB22590@us.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20090921223257.GB22590@us.ibm.com>
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

On Mon, Sep 21, 2009 at 03:32:57PM -0700, malahal@us.ibm.com wrote:
> DevSize is smaller than PSize!
 
Yes, we've seen a few of these recently.
Would be useful if the reporters gave more background context to see
if there are any common factors between the cases that could lead to
mitigation.

Alasdair
