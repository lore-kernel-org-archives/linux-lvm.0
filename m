Subject: Re: [linux-lvm] MultiPath
From: Andrew Patterson <andrew@fc.hp.com>
In-Reply-To: <1053638386.3459.66.camel@prvpcompq249.css.twable.com>
References: <1053638386.3459.66.camel@prvpcompq249.css.twable.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1053640645.523.1.camel@lvadplx>
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
Date: Thu May 22 16:56:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thu, 2003-05-22 at 15:19, Ryan Frank wrote:
> Hello All!
> 
> I am running RedHat AS 2.1 2.4.9-e3custom kernel (Many reasons why so
> old)... I have compiled in the the default LVM and multipath options in
> the kernel.  I have also compiled in the new drivers for my FC Cards
> (Qlogic 2300).  I can see all my storage... However! I cannot seem to
> get the multipathing to work.  I see all 6 drives (3 from each card)...
> Is there a magic trick to get the multipathing to work?  I am at a loss
> here...
> 

If you are using MD multipathing, you need to edit/create an
/etc/raidtab file and then run mkraid or raidstart.  You then use a
/dev/md* device to access your storage.

Andrew

> -- 
> +----------------------------------------------------+
> |Ryan Frank               Unix System Administrator  |
> |Time Warner Cable        7910 Crescent Executive Dr.|
> |(704) 731-3324 - phone   3rd Floor                  |
> |(704) 731-1180 - fax     Charlotte, NC 28217        |
> |150*143328*1 - nextel    ryan.frank@twcable.com     |
> +----------------------------------------------------+
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
-- 
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   Andrew Patterson                          Voice:  (970) 898-3261
   Hewlett-Packard Company                   Email:  andrew@fc.hp.com
