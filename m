Subject: Re: [linux-lvm] To compile
In-Reply-To: Your message of
    "Thu, 21 Feb 2002 13:45:37 +0100."
    <20020221124537.GA7834@balu.kawo2.rwth-aachen.de>
References: <E16drv2-0007wf-00@arwen.dev33.cvf>
    <20020221124537.GA7834@balu.kawo2.rwth-aachen.de>
MIME-Version: 1.0
From: Pierrick PONS <ppons@cvf.fr>
Message-Id: <E16dsrZ-0008FO-00@arwen.dev33.cvf>
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
Date: Thu Feb 21 07:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> On Thu, Feb 21, 2002 at 01:01:48PM +0100, Pierrick PONS wrote:
> > 
> > When I want to start with lvm, here is my problem :
> > pvcreate /dev/sdb
> > pvcreate: error in loading shared libraries: liblvm-10.so.1: cannot open 
> > shared object file: No such file or directory
> > 
> > I don't really understand, liblvm is in /usr/local/lib as a link pointing to 
> > /usr/local/stow/lvm/lib .
> 
> Is /usr/local/lib in your Library Path? Add this path to
> /etc/ld.so.conf, run ldconfig and retry it.
> 
> If you already did so, sorry for my question :)
> 
> Regards, Markus
> 

I had seen that linking liblvm-10.so.1 in /lib with 
/usr/local/stow/lvm/lib/liblvm-10.so.1 permitted to start pvcreate .

I did what you wrote and it works perfectly. I'm sorry for this stupid 
question .

You're the boss.

Thanks a lot.



Pierrick
