From: <jrelist@ntlworld.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20030123143305.MLXI4699.mta03-svc.ntlworld.com@[10.137.100.63]>
Subject: [linux-lvm] Installing LVM on s/390 redhat 7.2 2.4.7-39
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
Date: Thu Jan 23 08:32:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi

I'm wondering has anybody been able to install LVM onto s/390 Redhat Linux 7.2 ? I have kernel 2.4.7-39 running and the rpm for lvm 1.0.3. is part of the build, but not the lvm-mod.o module. 

I've attempted rebuilding the kernel from source with patches etc. from versions 1.0.3 and 1.0.6 following the instructions from sistina and redhat (including enabling lvm support !) but I always fall at the final hurdle, when doing the make_install :

---------------------------------------
cd /lib/modules/2.4.9-37lvm; \                                                  
mkdir -p pcmcia; \                                                              
find kernel -path '*/pcmcia/*' -name '*.o' | xargs -i -r ln -sf ../{} pcmcia    
if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.9-37lvm; fi      
depmod: *** Unresolved symbols in /lib/modules/2.4.9-37lvm/kernel/drivers/md/lvm
-mod.o                                                                          
depmod:         alloc_kiovec                                                    
depmod:         free_kiovec                                                     
make: *** [_modinst_post] Error 1                                               
[root@rother-8 linux]#              
------------------------------------

If anyone can help me, I'd be grateful. I'm an os/390 guy, this is my first dive into the Linux pool and so far I'm enjoying it !

Thanks in advance

John Ellis
UK
