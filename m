Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t66BDZgC003448
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 6 Jul 2015 07:13:35 -0400
Received: from alukardd.org (alukardd.org [188.134.93.171])
	by mx1.redhat.com (Postfix) with ESMTPS id 122DC19CB88
	for <linux-lvm@redhat.com>; Mon,  6 Jul 2015 11:13:34 +0000 (UTC)
Received: from alukardd.org ([172.17.0.101]:48003 helo=mail.alukardd.org)
	by alukardd.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84) (envelope-from <alukardd@alukardd.org>)
	id 1ZC4L4-0005wp-6J
	for linux-lvm@redhat.com; Mon, 06 Jul 2015 14:13:31 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 06 Jul 2015 14:13:30 +0300
From: Alexey <alukardd@alukardd.org>
In-Reply-To: <1a094ba3c1585eceac30e6f76efaf878@alukardd.org>
References: <1a094ba3c1585eceac30e6f76efaf878@alukardd.org>
Message-ID: <8b6060087ce56435abff3e67c9dd6b15@alukardd.org>
Subject: Re: [linux-lvm] compilation problem 2.02.125
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux lvm <linux-lvm@redhat.com>

We found that is my fault of git merge. I lost part of source code. 
Sorry.

On 2015-07-06 11:56, Alexey wrote:
> Hello.
> 
> I cloned master branch and tried to compile it.
> But I got the following errors:
> lvconvert.c:732:64: error: invalid application of 'sizeof' to
> incomplete type 'struct poll_operation_id'
> lvconvert.c:740:3: warning: passing argument 2 of '_destroy_id' from
> incompatible pointer type [enabled by default]
> lvconvert.c:718:13: note: expected 'struct poll_operation_id *' but
> argument is of type 'struct poll_operation_id *'
> lvconvert.c:744:4: error: dereferencing pointer to incomplete type
> lvconvert.c:745:4: error: dereferencing pointer to incomplete type
> lvconvert.c:746:4: error: dereferencing pointer to incomplete type
> lvconvert.c:746:18: error: dereferencing pointer to incomplete type
> lvconvert.c:746:106: error: dereferencing pointer to incomplete type
> lvconvert.c:746:165: error: dereferencing pointer to incomplete type
> lvconvert.c:746:208: error: dereferencing pointer to incomplete type
> lvconvert.c:747:4: error: dereferencing pointer to incomplete type
> lvconvert.c:749:9: error: dereferencing pointer to incomplete type
> lvconvert.c:749:25: error: dereferencing pointer to incomplete type
> lvconvert.c:749:41: error: dereferencing pointer to incomplete type
> lvconvert.c:749:62: error: dereferencing pointer to incomplete type
> lvconvert.c:774:5: error: too few arguments to function 'poll_daemon'
> 
> I tried to compile it under debian wheezy
> environment(linux-headers-3.2.0, libdevmapper-dev 1.02.74) and under
> debian jessie environment(linux-headers-3.16.0, libdevmapper-dev
> 1.02.90) and got same error in both situations.
> 
> I can't understand where I'm wrong...
> 
> Regards,
> Alexey Mochkin
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
