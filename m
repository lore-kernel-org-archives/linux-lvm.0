From: Jan Kara <jack@suse.cz>
Message-Id: <20020402185434.GD24145@atrey.karlin.mff.cuni.cz>
References: <004a01c1d56b$cae7cb50$3b00a8c0@aplabwp0368359>
    <20020328083015.G47866@wobbly.melbourne.sgi.com>
    <200203291222.EAA25283@deliverator.sgi.com>
    <20020402085912.G52863@wobbly.melbourne.sgi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020402085912.G52863@wobbly.melbourne.sgi.com>
Subject: [linux-lvm] Re: DQUOT_SYNC undefined in XFS CVS kernel (was: Can't build CVS
 kernels of 20020321 & 20020327)
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
Date: Tue Apr  2 12:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan Scott <nathans@sgi.com>
Cc: Adrian Head <ahead@bigpond.net.au>, Bas <weblists@gmx.net>, linux-xfs@oss.sgi.com, linux-lvm@sistina.com

> On Fri, Mar 29, 2002 at 10:26:41PM +1000, Adrian Head wrote:
...
> > Grep'ing through the kernel I have not been able to find any comments or 
> > explanations regarding this - so I have assumed that DQUOT_SYNC can be 
> > changed to DQUOT_SYNC_DEV without problems.  
> 
> Yes, by my understanding of the VFS quota subsystem that would
> be the correct thing to do.
> 
> > After making that change the kernel compiles cleanly and boots.  I'm unsure 
> > as yet if I have done the correct thing here.  Hopefuly someone will be able 
> > to help us out and correct me if I'm incorrect.
> 
> I believe your change is correct, I've CC'd Jan in case there is
> anything that I've overlooked.
  The change looks OK.

									Honza

--
Jan Kara <jack@suse.cz>
SuSE CR Labs
