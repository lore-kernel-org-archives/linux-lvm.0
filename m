Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8NHrjr14912
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 13:53:45 -0400
Received: from visp.engelschall.com (visp.engelschall.com [195.27.176.148])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8NHrjRb022723
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 13:53:45 -0400
Date: Thu, 23 Sep 2004 19:53:22 +0200
From: "Ralf S. Engelschall" <rse@engelschall.com>
Subject: Re: [linux-lvm] LVM UUIDs are not UUIDs!?
Message-ID: <20040923175322.GA6110@engelschall.com>
References: <20040923084741.GA5658@engelschall.com>
	<1095959414.26438.27.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1095959414.26438.27.camel@tesuji.nac.uci.edu>
Reply-To: rse@engelschall.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Sep 23, 2004, Dan Stromberg wrote:

> Same in concept, different implementation, easier to use?
>
> The Lustre does the same thing: It has what it calls UUID's, that are
> actually more descriptive strings than what the standard calls for.
> [...]

Well, it's 100% ok if one implements own ids with more descriptive
strings which are not conforming to the UUID or any other id standard.
My only concern is that then the result should be better not named UUID
because that's already (since many years) the official name of the
ids from DCE 1.1 and ISO/IEC 11578:1996. It is like using an object
addressing scheme producing strings like "foo!bar!quux" but calling
them "URLs"... ;-)
                                       Ralf S. Engelschall
                                       rse@engelschall.com
                                       www.engelschall.com
