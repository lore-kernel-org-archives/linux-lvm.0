Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j0BELHxg001034
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2005 14:21:17 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CoMtZ-0006ql-1a
	for linux-lvm@redhat.com; Tue, 11 Jan 2005 14:21:17 +0000
Date: Tue, 11 Jan 2005 14:21:17 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] scary message (incorrect header checksum)
Message-ID: <20050111142116.GT26670@agk.surrey.redhat.com>
References: <200501102144.34198.cousinmarc@free.fr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200501102144.34198.cousinmarc@free.fr>
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

On Mon, Jan 10, 2005 at 09:44:34PM +0100, Marc Cousin wrote:
> flo:~# vgscan
>   Reading all physical volumes.  This may take a while...
>   Incorrect metadata area header checksum
>   Found volume group "data" using metadata type lvm2
 
> It doesn't seem to be a problem, as the lvms are working correctly, but I'd 
> like to get rid of this warning...
> How can I do this ?
 
The message might come from a volume that is not part of your
volume group.

Add '-vvvv' for debugging information to see what is causing the
message.

Alasdair
-- 
agk@redhat.com
