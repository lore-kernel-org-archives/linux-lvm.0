From: Markus Dobel <mdobel@kawo2.rwth-aachen.de>
Subject: Re: [linux-lvm] To compile
Message-Id: <20020221124537.GA7834@balu.kawo2.rwth-aachen.de>
References: <E16drv2-0007wf-00@arwen.dev33.cvf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16drv2-0007wf-00@arwen.dev33.cvf>
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
Date: Thu Feb 21 06:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 21, 2002 at 01:01:48PM +0100, Pierrick PONS wrote:
> 
> When I want to start with lvm, here is my problem :
> pvcreate /dev/sdb
> pvcreate: error in loading shared libraries: liblvm-10.so.1: cannot open 
> shared object file: No such file or directory
> 
> I don't really understand, liblvm is in /usr/local/lib as a link pointing to 
> /usr/local/stow/lvm/lib .

Is /usr/local/lib in your Library Path? Add this path to
/etc/ld.so.conf, run ldconfig and retry it.

If you already did so, sorry for my question :)

Regards, Markus
