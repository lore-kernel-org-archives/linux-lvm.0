Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1CHYGS9026200
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 12:34:17 -0500
Received: from nerv.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o1CHY0vP026780
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 12:34:01 -0500
Received: from [IPv6:2002:52b6:8514:200:21d:7dff:fea1:197]
	([IPv6:2002:52b6:8514:200:21d:7dff:fea1:197]) (authenticated bits=0)
	by nerv.dolda2000.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
	o1CHMWlZ018506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 18:22:32 +0100
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <20100112191609.GA28804@us.ibm.com>
References: <1263228858.2845.12.camel@pc7.dolda2000.com>
	<b74494e61001111026g29f01b4ei2fc339ff980edba7@mail.gmail.com>
	<1263268475.3246.1.camel@pc7.dolda2000.com>
	<20100112191609.GA28804@us.ibm.com>
Date: Fri, 12 Feb 2010 18:22:32 +0100
Message-ID: <1265995352.2794.6.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Removing a PV from a mirror
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2010-01-12 at 11:16 -0800, malahal@us.ibm.com wrote:
> Fredrik Tolf [fredrik@dolda2000.com] wrote:
> > I'm still just wondering how to actually remove the PV from the mirror.
> 
> 2) lvconvert -m0 <LV-name> <Failing-PV-name>
> 	Make sure this did remove the PV you wanted. If not, use
> 	vgcfgrestore to restore and ask for help...

Ah, so that's how you do it! Thanks a lot!

Fredrik Tolf
