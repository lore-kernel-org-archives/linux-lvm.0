From: "Jason H. Smith" <jason@oes.co.th>
Subject: Re: [linux-lvm] LVM on Raid 5 Performance?
References: <92091C60D5E2B74CB77C1FDB84F5FA76F079@s99mail02.okdhs.org>
In-Reply-To: <92091C60D5E2B74CB77C1FDB84F5FA76F079@s99mail02.okdhs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200305182148.27901.jason@oes.co.th>
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
Date: Mon May 19 01:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I don't know if this answers your question, but maybe search the archives 
for my posts a few months ago.  On 2.4, there's a misfeature when using 
LVM with RAID5.  Basically, the two will cause your system not to cache 
any data, and to sync to disk immediately, once you create a snapshot 
volume.  Apparently, this will be addressed in 2.6.

So if you want RAID5 and LVM, consider hardware acceleration.

HTH

-- 
GPG: 03EE 9EB8 E500 874A F509  7B95 9B9A 84A1 26E9 4F79
http://www.ece.utexas.edu/~jhs/public_key.gpg
