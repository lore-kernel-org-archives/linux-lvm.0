Subject: Re: re[2]: [linux-lvm] Draft Snapshot Regression Test
From: Steve Lord <lord@sgi.com>
In-Reply-To: <20020829152401.LOFW15640.imf00bis.bellsouth.net@TAZ2>
References: <20020829152401.LOFW15640.imf00bis.bellsouth.net@TAZ2>
Content-Transfer-Encoding: 7bit
Message-Id: <1030635020.31693.9.camel@jen.americas.sgi.com>
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
Date: Thu Aug 29 10:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: freemyer@norcrossgroup.com, linux-lvm@sistina.com

On Thu, 2002-08-29 at 10:21, Greg Freemyer wrote:

> 
> Steve,
> 
> Thanks for running it.  
> 
> I was afraid I would get that question.
> 
> I have never compiled a kernel, and I was specifically avoiding it until I got at least one "it works with cvs" message.  I guess I have that now.
> 
> It might take a day or two to get it done, but I will try to do so.
> 

Greg, there are lots of folks who can help with that, the hardest 
part is probably getting the correct kernel configuration for your
setup, the ones vendor's supply will basically build all the
possible device drivers - which you do not need. There are
instructions on the oss web site for how to download the cvs tree.

Steve

-- 

Steve Lord                                      voice: +1-651-683-3511
Principal Engineer, Filesystem Software         email: lord@sgi.com
