From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] LMV install on RH 7.1
Message-ID: <220890000.1037820129@[192.168.200.4]>
In-Reply-To: <003f01c290a8$032ecf20$7327dbd1@policeforum.org>
References: <003f01c290a8$032ecf20$7327dbd1@policeforum.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Nov 20 13:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- TED MORRIS <Ted@panafsat.com>

>
> I am a linux newbie. I desperately need to install LVM 1.0.6 on Redhat
> 7.1 but can't seem to make it work.The file is a tar file. Any tips.
> Thanks

What are you having trouble with (e.g., extracting the
tarball contents, configure)?

Simplest fix is either:

	gzip -dc blah.tar.gz | cpio -idv;

or

	bzip2 -dc blah.tar.bz2 | cpio -idv;

depending on the squish format.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
