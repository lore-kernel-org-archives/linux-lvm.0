From: Marc Cousin <cousinmarc@free.fr>
Subject: Re: [linux-lvm] libgcc_s.so.1 dependancy
References: <200307151853.56054.cousinmarc@free.fr> <1058352267.3813.17.camel@chtephan.cs.pocnet.net> <20030716135857.GC29944@ti19>
In-Reply-To: <20030716135857.GC29944@ti19>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200307161837.44965.cousinmarc@free.fr>
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
Date: Wed Jul 16 11:33:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

It was the libdevmapper which was linked to libgcc_s
I recompiled the libdevmapper, and the dependancy disappeared ... anyone has 
got an idea about what I've done wrong the first time ? :)

On Wednesday 16 July 2003 15:58, Bill Rugolsky Jr. wrote:
> On Wed, Jul 16, 2003 at 12:44:27PM +0200, Christophe Saout wrote:
> > Something has to be different on his system. Where's the depencency
> > coming from? From libdevmapper.so or from the tool itself?
>
> Probably 64-bit math. Related to the DM interface change?
>
> Regards,
>
> 	Bill Rugolsky
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
   Often it takes some calamity to make us live in the present. Then suddenly
we wake up and see all the mistakes we have made. But it is too late to change
anything.	  -- Calvin
