Subject: Re: [linux-lvm] Draft Snapshot Regression Test
From: Steve Lord <lord@sgi.com>
In-Reply-To: <20020828233112.TOPE8089.imf02bis.bellsouth.net@TAZ2>
References: <20020828233112.TOPE8089.imf02bis.bellsouth.net@TAZ2>
Content-Transfer-Encoding: 7bit
Message-Id: <1030633187.31693.3.camel@jen.americas.sgi.com>
Mime-Version: 1.0
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
Date: Thu Aug 29 10:00:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wed, 2002-08-28 at 18:28, Greg Freemyer wrote:
> All,
> 
> I just sent the below snapshot regression test to the XFS mailing list
> 
> It is designed to run from the XFS test harness, but that it should be easy to convert to be simply run by hand.
> 
> I have only tried it on a LVM 1.0.3 / xfs 1.1 / 2.4.19pre4-aa kernel and it fails within 10 iterations every time.
> 

Greg, I have been running your test here on a 2.4.19-xfs kernel from our
CVS tree, using the LVM which is in the kernel. So far it is chugging
along quite happily without failure. Can you try this kernel?

Steve

-- 

Steve Lord                                      voice: +1-651-683-3511
Principal Engineer, Filesystem Software         email: lord@sgi.com
