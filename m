Subject: Re: [linux-lvm] How to fix inconsistent LV structs?
References: <3D9F6C62.1040004@raffael.ch> <20021007104201.A17176@sistina.com>
From: Raffael Herzog <herzog@raffael.ch>
In-Reply-To: <20021007104201.A17176@sistina.com>
Message-ID: <87ptumhaj4.fsf@mail.raffael.ch>
MIME-Version: 1.0
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
Date: Mon Oct  7 04:29:55 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Heinz,

Heinz J . Mauelshagen wrote:

> Hmmm...
> Sounds like a nasty overwrite but it is hard to tell because you
> can't remmeber the exact details :(

Well, I can, the syslog is one of the only things that still
exist, besides the backup... :-) These are the last few
messages of the catastrophic reboot:

,----[ /var/log/syslog ]
| Oct  5 21:08:33 rumba kernel: Coda: Bye bye.
| Oct  5 21:08:33 rumba kernel: redir cleanup
| Oct  5 21:08:33 rumba kernel: replacing syscall nr.  12 [e0a01674] with [c012e408]
| Oct  5 21:08:33 rumba kernel: replacing syscall nr. 106 [e0a017a0] with [c0134ad0]
| Oct  5 21:08:33 rumba kernel: replacing syscall nr. 107 [e0a0184c] with [c0134bb0]
| Oct  5 21:08:33 rumba kernel: replacing syscall nr.  33 [e0a018fc] with [c012e2dc]
| Oct  5 21:08:33 rumba kernel: replacing syscall nr.   5 [e0a019c0] with [c012ecb4]
| Oct  5 21:08:33 rumba kernel: replacing syscall nr.  85 [e0a01a9c] with [c0134ce0]
| Oct  5 21:08:33 rumba kernel: replacing syscall nr. 183 [e0a01bd0] with [c013ef44]
| Oct  5 21:08:33 rumba kernel: replacing syscall nr. 195 [e0a01d7c] with [c0134ebc]
| Oct  5 21:08:33 rumba kernel: replacing syscall nr. 196 [e0a01e30] with [c0134f30]
| Oct  5 21:08:33 rumba kernel: replacing syscall nr.  11 [e0a01f4c] with [c0105a30]
| Oct  5 21:08:33 rumba kernel: Unable to handle kernel paging request at virtual address e0a019fb
| Oct  5 21:08:33 rumba kernel:  printing eip:
| Oct  5 21:08:33 rumba kernel: e0a019fb
| Oct  5 21:08:33 rumba kernel: *pde = 01870067
| Oct  5 21:08:33 rumba kernel: *pte = 00000000
| Oct  5 21:08:33 rumba kernel: Oops: 0000
| Oct  5 21:08:33 rumba kernel: CPU:    0
| Oct  5 21:08:33 rumba kernel: EIP:    0010:[<e0a019fb>]    Tainted: P 
| Oct  5 21:08:33 rumba kernel: EFLAGS: 00010286
| Oct  5 21:08:33 rumba kernel: eax: 00000005   ebx: 08094482   ecx: d27ea3e0   edx: c1807ea0
| Oct  5 21:08:33 rumba kernel: esi: 00000241   edi: 08094482   ebp: dcda5fbc   esp: dcda5f94
| Oct  5 21:08:33 rumba kernel: ds: 0018   es: 0018   ss: 0018
| Oct  5 21:08:33 rumba kernel: Process avfscoda (pid: 354, stackpage=dcda5000)
| Oct  5 21:08:33 rumba kernel: Stack: 08094482 00000241 000001b6 dd27e360 dcda4000 00000241 08094482 00000001 
| Oct  5 21:08:33 rumba kernel:        c0141df8 c0106e0c bffff6f8 c0106d1b 08094482 00000241 000001b6 00000241 
| Oct  5 21:08:33 rumba kernel:        08094482 bffff6f8 00000005 0000002b 0000002b 00000005 4017b2e4 00000023 
| Oct  5 21:08:33 rumba kernel: Call Trace: [sys_oldumount+12/16] [error_code+52/60] [system_call+51/56] 
| Oct  5 21:08:33 rumba kernel: 
| Oct  5 21:08:33 rumba kernel: Code:  Bad EIP value.
| Oct  5 21:08:33 rumba kernel:  <6>i8k: module unloaded
| Oct  5 21:08:35 rumba nmbd[7091]: [2002/10/05 21:08:35, 0] nmbd/nmbd.c:sig_term(63) 
| Oct  5 21:08:35 rumba nmbd[7091]:   Got SIGTERM: going down... 
| Oct  5 21:08:35 rumba xfs[593]: terminating 
| Oct  5 21:08:35 rumba xfs[594]: terminating 
| Oct  5 21:08:35 rumba ntpd[604]: ntpd exiting on signal 15
| Oct  5 21:08:36 rumba usbmgr[12064]: umount /proc/bus/usb
| Oct  5 21:08:36 rumba rpc.statd[265]: Caught signal 15, un-registering and exiting.
| Oct  5 21:08:36 rumba kernel: Kernel logging (proc) stopped.
| Oct  5 21:08:36 rumba kernel: Kernel log daemon terminating.
| Oct  5 21:08:36 rumba exiting on signal 15
`----

For a very short time (that laptop is *fast* :-) I've seen a
message about a failed umount, then it went down and never
came up again.


> > But how do I clear these structs?
> 
> Presuming that the metadata backups are intact, you need to "pvcreate -ff"
> the physical volumes and run vgcfgrestore on each of them.
> "vgscan ; vgchange -ay" should get you back to business afterwards.

Yes, I thought this would help, too. But it didn't. :-(

Commands always failed with "pv_read(): read" or "pv_read():
<something about creating names from kdev>". Because I
needed my laptop back up again today I restored my backup
yesterday evening, so unfortunately I can't help anymore to
find out what actually happened... :-(


cu,

   Raffi


-- 
=> Neu im Usenet? Fragen?    http://www.use-net.ch/usenet_intro_de.html <=
  The difference between theory and practice is that in theory, there is
                 no difference, but in practice, there is.
Raffael Herzog - herzog@raffael.ch - http://www.raffael.ch - ICQ #67961355
