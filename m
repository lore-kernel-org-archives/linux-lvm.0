Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q04MoGkw011082
	for <linux-lvm@redhat.com>; Wed, 4 Jan 2012 17:50:16 -0500
Received: from walrus.jabberwocky.com (walrus.jabberwocky.com [173.9.29.57])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q04MoFVS001433
	for <linux-lvm@redhat.com>; Wed, 4 Jan 2012 17:50:15 -0500
Received: from dshaw.nasuni.net (vpn.nasuni.com [173.166.63.186])
	(authenticated bits=0)
	by walrus.jabberwocky.com (8.14.4/8.14.4) with ESMTP id q04MoDHR030112
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 4 Jan 2012 17:50:14 -0500
From: David Shaw <dshaw@jabberwocky.com>
Content-Type: multipart/mixed;
	boundary="Apple-Mail=_86322B42-1ED1-41F0-895B-F1B07E0BB8BB"
Date: Wed, 4 Jan 2012 17:50:13 -0500
Message-Id: <7D2B67C5-B2AC-4319-9818-B7E1DF896D04@jabberwocky.com>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Subject: [linux-lvm] DM suspend locks up under load?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--Apple-Mail=_86322B42-1ED1-41F0-895B-F1B07E0BB8BB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

I'm using some code that creates a snapshot using DM directly (we aren't =
using LVM), using essentially:

  suspend linear device X
  reload X as a "snapshot-origin" device
  create "snapshot" device
  resume original X device (which is now a snapshot-origin)

This has worked fine for several years.  Recently, however, we updated =
to a more recent system, and ext4, and are seeing something odd.  Under =
load, the process above freezes at the first suspend step, and locks up =
the device in question, requiring a reboot to fix things.

I wrote the attached program to demonstrate the problem.  All it does it =
call DM_DEVICE_SUSPEND and DM_DEVICE_RESUME over and over on a DM =
device.  Basically, run the test program on any mounted linear DM target =
in one shell, then delete a lot of data from a directory residing on =
that device in another shell.  On my systems this will freeze both the =
test program and the rm in D state, and require a reboot to fix things.

I've tried multiple different kernels, but at the moment, I'm using =
kernel-PAE-2.6.35.6-45.fc14.i686 and =
device-mapper-libs-1.02.63-2.fc14.i686.

One clue I can add is that it only seems to happen if the filesystem on =
the device is ext4.  It does not happen with ext3.

Any ideas on where I should look next?

Thanks,

David


--Apple-Mail=_86322B42-1ED1-41F0-895B-F1B07E0BB8BB
Content-Disposition: attachment;
	filename=suspendtest.c
Content-Type: application/octet-stream;
	name="suspendtest.c"
Content-Transfer-Encoding: 7bit

#include <stdio.h>
#include <libdevmapper.h>

static int
dm_command(int command,const char *device)
{
  int ret=0;
  struct dm_task *dmt;

  dmt=dm_task_create(command);
  if(!dmt)
    return 0;

  if(!dm_task_set_name(dmt,device))
    goto fail;

  ret=dm_task_run(dmt);

 fail:

  dm_task_destroy(dmt);

  return ret;
}

int
main(int argc,char *argv[])
{
  if(argc<2)
    {
      printf("%s <DM name>\n",argv[0]);
      return 1;
    }

  dm_udev_set_sync_support(0);

  printf("Suspending and resuming %s\n",argv[1]);

  for(;;)
    {
      if(!dm_command(DM_DEVICE_SUSPEND,argv[1]))
	{
	  fprintf(stderr,"Unable to suspend %s\n",argv[1]);
	  break;
	}

      printf("/\r");
      fflush(stdout);

      if(!dm_command(DM_DEVICE_RESUME,argv[1]))
	{
	  fprintf(stderr,"Unable to resume %s\n",argv[1]);
	  break;
	}

      printf("\\\r");
      fflush(stdout);
    }

  return 0;
}

--Apple-Mail=_86322B42-1ED1-41F0-895B-F1B07E0BB8BB--
