From: Markus Dobel <mdobel@kawo2.rwth-aachen.de>
Subject: Re: [linux-lvm] lvcreate, vgscan problem!
Message-Id: <20020118144035.GA31421@balu.kawo2.rwth-aachen.de>
References: <20020118141431.32744.qmail@web13005.mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020118141431.32744.qmail@web13005.mail.yahoo.com>
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
Date: Fri Jan 18 08:41:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 18, 2002 at 06:14:31AM -0800, Prashant Kharche wrote:
> Hi! 
>     I have LVM 1.0.4.rc4 package and linux kernel
> 2.4.17. Following commands are giving me errors :
> 
> vgscan - > gives error message as 
> " Invalidate :Busy Buffer ..."

Ignore that.

> pvcreate, vgcreate commands are working properly.. and
> also manages to create to volume groups.. 
> my sequence of commands is -
> 1.vgscan 
> 2.pvcreate
> 3.vgcreate
> 4.lvcreate : gives me error ..
> 
> What should i do to avoid this error ??

Would be helpful to tell what error you get. Please paste the error
message.

> Also, I have compiled the kernel 2.4.17 and loaded the
> LVM module.. and installed the LVM package 1.0.4rc4..
> 
> Everytime i have to load the module "lvm-mod.o"
> manually.. how do i add it to startup script.. ??

Read "INSTALL". Especially the part about /etc/modules.conf

Regards, Markus

-- 
Free the Fluffy Bunny.
