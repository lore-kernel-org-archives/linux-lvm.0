MIME-Version: 1.0
From: Pierrick PONS <ppons@cvf.fr>
Message-Id: <E16drv2-0007wf-00@arwen.dev33.cvf>
Subject: [linux-lvm] To compile
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
Date: Thu Feb 21 06:02:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello all,

I've compiled lvm-1.0.3 using stow.
But a lib is missed

./configure --prefix=/usr/local/stow/lvm
make
make install


cd /usr/local/stow
stow -vv lvm



When I want to start with lvm, here is my problem :
pvcreate /dev/sdb
pvcreate: error in loading shared libraries: liblvm-10.so.1: cannot open 
shared object file: No such file or directory

I don't really understand, liblvm is in /usr/local/lib as a link pointing to 
/usr/local/stow/lvm/lib .

Is it impossible to compile lvm and use stow ?

I'm sorry, maybe it's a newbie question.


Thanks


Pierrick
