Message-ID: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560D49@s99mail06>
From: "Little, Chris" <Chris.Little@okdhs.org>
Subject: RE: [linux-lvm] EXT3 vs Reiserfs
MIME-Version: 1.0
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
Date: Mon Dec  8 09:16:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

It also depends on your workload.  If you are serving a large database,
reiser (the last i heard) is probably a bad choice. fwiw oracle won't
support performance issues if you are running on reiser.

> -----Original Message-----
> From: Markus Schiltknecht [mailto:markus@bluegap.ch]
> Sent: Sunday, December 07, 2003 8:51 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] EXT3 vs Reiserfs
> 
> 
> Hi Yanick
> 
> On Mon, 2003-12-08 at 15:39, Yanick Quirion wrote:
> > I'm just asking for your personal opinion and knowledge with them.
> 
> I'm using ReiserFS on my LVM volume, having already used the 'extend
> online' function. I don't really need ACLs currently.
> 
> Concerning stability: I've once had a crash due to a power 
> loss. Then I
> must have done something wrong with LVM. Anyway, I've lost many files,
> but don't think that was ReiserFS's fault.
> 
> I'm also using ReiserFS on a (relatively) heavily used 
> webserver (2x AMD
> 2000+, 120GB HDD, ~100 GB Traffic / Month) and have never had problems
> (there w/o LVM, pure ReiserFS partitions).
> 
> 
> Markus
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
