From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] LVM Reboot Problem
Message-ID: <49160000.1021989838@[192.168.200.4]>
In-Reply-To: <NGBBJICHELACNEPKDJKGKEJBCAAA.jbrett@wheremedia.com>
References: <NGBBJICHELACNEPKDJKGKEJBCAAA.jbrett@wheremedia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Tue May 21 09:06:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Jonathan Brett <jbrett@wheremedia.com>

> I have my system configured with Redhat 7.3 with 2 80GB hard drives.  I
> made a volume group using /dev/hdc and /dev/hda9.  Everything worked
> fine, I copied data in there, put in the 'vgscan' and 'vgchange -a y' in
> the startup script and put 'vgchange -a n' into the shutdown script.
> However, when I reboot my machine, the data is lost :(  I do a 'locate'
> on a file I know is in there and it finds it.  However when I do a 'ls'
> in the directory, nothing shows up.

Looks like a file system problem that has nothing to do with
LVM. What file system are you using? What does fsck -f do on
the logical volume?

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
