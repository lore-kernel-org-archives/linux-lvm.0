From: YouMizuki <appendix@hatsune.cc>
Subject: Re: [linux-lvm] trouble of reduce pv
In-Reply-To: <20011029231427.A18988@sistina.com>
References: <20011030032905.93E1.APPENDIX@hatsune.cc> <20011029231427.A18988@sistina.com>
Message-Id: <20011030103149.B7D0.APPENDIX@hatsune.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Oct 29 19:35:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thanks for your answer.

> You need to restore the metadata formerly stored on md10 to a valid device
> using the LVM vgcfgrestore(8) command.
> Then you can run vgscan and "vgchange -ay".

 "/etc/lvmtab.d/" was losted with "/dev/md10".

Isn't there any method of reviving VG without /etc/lvmtab.d/ ?
For example, isn't there any method of creating metadata personally?

-- 
YouMizuki <appendix@hatsune.cc>
