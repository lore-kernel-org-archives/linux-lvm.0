Received: from [10.40.200.19] (ovpn-200-19.brq.redhat.com [10.40.200.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t66BFuIG014775
	for <linux-lvm@redhat.com>; Mon, 6 Jul 2015 07:15:57 -0400
References: <1a094ba3c1585eceac30e6f76efaf878@alukardd.org>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <559A636C.7050703@redhat.com>
Date: Mon, 6 Jul 2015 13:15:56 +0200
MIME-Version: 1.0
In-Reply-To: <1a094ba3c1585eceac30e6f76efaf878@alukardd.org>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 6.7.2015 v 10:56 Alexey napsal(a):
> Hello.
>
> I cloned master branch and tried to compile it.
> But I got the following errors:
> lvconvert.c:732:64: error: invalid application of 'sizeof' to incomplete type
> 'struct poll_operation_id'
> lvconvert.c:740:3: warning: passing argument 2 of '_destroy_id' from
> incompatible pointer type [enabled by default]
> lvconvert.c:718:13: note: expected 'struct poll_operation_id *' but argument
> is of type 'struct poll_operation_id *'
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
> I tried to compile it under debian wheezy environment(linux-headers-3.2.0,
> libdevmapper-dev 1.02.74) and under debian jessie
> environment(linux-headers-3.16.0, libdevmapper-dev 1.02.90) and got same error
> in both situations.
>
> I can't understand where I'm wrong...

Please attach your whole  configure options and log.

Normally you do not need libdevmapper-dev - since whole libdm is emebeded into 
lvm2 so for compilation you are always using headers from the same source tree.

Regards

Zdenek
