From: Kai Weber <lists@glorybox.de>
Subject: Re: [linux-lvm] Get rid of files of a non existing volume group
Message-ID: <20020706130052.GA915@glorybox.de>
References: <20020705205324.GA1287@glorybox.de> <20020706082758.GC13154@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020706082758.GC13154@tykepenguin.com>
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
Date: Sat Jul  6 08:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

+ Patrick Caulfield <caulfield@sistina.com>:

> > Can I 'rm -rf /dev/datavg' the files? Or should I do a vgextend?
> 
> You can safely delete the directory. When you re-created the VG and
> LVs then nodes will be re-created.

It worked. I ever thought the dev-files for LVM are created dynamicly.
So I feared removing the files would not be succesfull. And I am not a
friend of experiments... *g*

Thank you
Kai
