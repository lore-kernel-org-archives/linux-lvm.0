From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] LVM on Raid 5 Performance?
Message-ID: <20030519113159.GA23496@www.13thfloor.at>
References: <92091C60D5E2B74CB77C1FDB84F5FA76F079@s99mail02.okdhs.org> <200305182148.27901.jason@oes.co.th>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200305182148.27901.jason@oes.co.th>
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
Date: Mon May 19 06:31:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, May 18, 2003 at 09:48:27PM +0700, Jason H. Smith wrote:
> I don't know if this answers your question, but maybe search the archives 
> for my posts a few months ago.  On 2.4, there's a misfeature when using 
> LVM with RAID5.  Basically, the two will cause your system not to cache 
> any data, and to sync to disk immediately, once you create a snapshot 
> volume.  Apparently, this will be addressed in 2.6.

hmm, I read about that, but I guess that's not what 
happens, because a) I do not use the snapshot feature,
and b) the "raid5: switching cache buffer size" messages
only appear if I access the md device directly ...

> So if you want RAID5 and LVM, consider hardware acceleration.

I guess I will choose not to use LVM on this system ...

thanks,
Herbert

> HTH
> 
> -- 
> GPG: 03EE 9EB8 E500 874A F509  7B95 9B9A 84A1 26E9 4F79
> http://www.ece.utexas.edu/~jhs/public_key.gpg
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
